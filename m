From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 25 Dec 2013 10:05:20 +0100
Subject: [Buildroot] [PATCH] external python modules: remove redundant
 python dependency
In-Reply-To: <20131225095620.7e4d611c@skate>
References: <7ffd4acd582283fb083a.1387905292@argentina>
 <20131225095620.7e4d611c@skate>
Message-ID: <CAAXf6LX8HCcpYtC_8wAn49SU3aV+xf=Jr3RfuxH6HUQscnYnfQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Dec 25, 2013 at 9:56 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Tue, 24 Dec 2013 18:14:52 +0100, Thomas De Schampheleire wrote:
>> File package/Config.in already groups the external python modules inside a
>> 'if BR2_PACKAGE_PYTHON ... endif' statement, so adding a
>> 'depends on BR2_PACKAGE_PYTHON' statement to the individual Config.in files
>> is not needed.
>>
>> This is in line with the way gstreamer packages are handled.
>>
>> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> I don't agree with this change. This duplication of "depends on" is
> going to be really useful when we enable Python packages to be compiled
> with Python 3. When we'll do this, we will change the:
>
> if BR2_PACKAGE_PYTHON
> source ...
> source ...
> endif
>
> to:
>
> if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> source ...
> source ...
> endif
>
> But still we will want to be able to decide on a per-package basis
> which package is available for Python 2.x, for Python 3.x or for both.
>
> Therefore, I'd like to keep these "depends on" for the moment.

Ok, understood.
But in that case, I will submit another patch to make sure that all
these python modules do indeed use the 'depends on', because for
example python-bottle does not.

Best regards,
Thomas
