From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 1 Apr 2015 20:28:42 -0500
Subject: [Buildroot] [PATCH 1/1] jamvm: add depends on toolchain
	w/threads
In-Reply-To: <20150401235934.58eded2d@free-electrons.com>
References: <1427385280-63133-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20150401234340.1717eaf2@free-electrons.com>
 <871tk3r03i.fsf@dell.be.48ers.dk>
 <20150401235934.58eded2d@free-electrons.com>
Message-ID: <CANQCQpau5G=NqiHgmONpYH+CTF4Uv_BrFaVZdiBnSAj33y=Wog@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Wed, Apr 1, 2015 at 4:59 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Wed, 01 Apr 2015 23:48:49 +0200, Peter Korsgaard wrote:
>> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
>>
>> Hi,
>>
>> > Also, there's something fishy between jamvm and classpath.
>>
>>  > jamvm does select BR2_PACKAGE_CLASSPATH and has classpath in
>>  > JAMVM_DEPENDENCIES.
>>
>>  > But classpath has depends on BR2_PACKAGE_JAMVM in its Config.in.
>>
>>  > Does not make much sense. Peter, you followed the JamVM/Classpath
>>  > stuff. What do you think?
>>
>> Hmm, that indeed doesn't sound right. I think the jamvm select should be
>> dropped from classpath.
>
> There's no jamvm select in classpath, it's a 'depends on':
>
> config BR2_PACKAGE_JAMVM
>         bool "jamvm"
>         select BR2_PACKAGE_CLASSPATH
>
> config BR2_PACKAGE_CLASSPATH
>         bool "classpath"
>         depends on BR2_PACKAGE_JAMVM

Looking at http://www.gnu.org/software/classpath/stories.html#jvm it
looks like the jamvm "select" is correct but the classpath "depends"
should be removed.  (my interpretation of this is...) classpath is
just a library used by various JVMs so if another JVM was added to BR
we'd have to remove that depends anyway at that point and make that
JVM also do a select of classpath?


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com
