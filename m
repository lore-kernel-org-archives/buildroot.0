From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 5 Jun 2013 15:08:22 +0100
Subject: [Buildroot] [PATCH] bzip2: Rearrange build order
In-Reply-To: <20130605160438.2a47341b@skate>
References: <1370436976-746-1-git-send-email-markos.chandras@gmail.com>
 <877gi8ekf6.fsf@dell.be.48ers.dk> <20130605160438.2a47341b@skate>
Message-ID: <CAG2jQ8jcCqoTGi+zuWDSEk_BQqnLQJ+gqQrBqWqzJWzjzOEN3w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5 June 2013 15:04, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Wed, 05 Jun 2013 15:50:21 +0200, Peter Korsgaard wrote:
>
>> This works, but is afaik less efficient for the static lib case.
>>
>> The real fix is imho to build the object files twice, like how libtool
>> does it.
>>
>> If you look at the Debian package, they work around it by adding a
>> seperate .c -> .sho build rule, which adds -fPIC, and then link the .so
>> file with the .sho files instead.
>
> Are you sure there are not already many packages that build things only
> once with -fPIC and use that for both the static and the shared library?
>
> What you're proposing here is quite the opposite to what you merged
> (from me) in a33baa1ef9dadbec8e45d411c30d636fa6b8872a (icu: don't build
> object files twice).
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

My understanding is that there is a small performance penalty in
static libraries because of the GOT presence introduced by the shared
object. Apart from that, nothing else should change in the static
library.
Gentoo does the same thing for bzip2. It builds the shared library first.

--
Regards,
Markos Chandras
