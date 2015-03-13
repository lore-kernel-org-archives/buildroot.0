From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 13 Mar 2015 07:46:03 +0100
Subject: [Buildroot] Changing permission recursively
In-Reply-To: <20150313073131.7a16aeb6@free-electrons.com>
References: <CA+TH9VmbEdw=Zx3C1_fHcnK=FDum+6C6UbsVVad12yR3gmK7AA@mail.gmail.com>
 <20150312175527.GO2177@tarshish> <20150313073131.7a16aeb6@free-electrons.com>
Message-ID: <CA+TH9V=b-5KdMKQVWkZRZDh31qkKqBTqy+6MdqU3Sr+7wuGFkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

2015-03-13 7:31 GMT+01:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Baruch Siach,
>
> On Thu, 12 Mar 2015 19:55:28 +0200, Baruch Siach wrote:
>
>> How about running the following from a post build script (untested):
>>
>>       ${HOST_DIR}/usr/bin/fakeroot -- chown -R UID:GID ${1}/path/to/directory
>
> Does this actually works ?
>
> My understanding of fakeroot is that you have to execute all the
> fakeroot'ed commands under the same fakeroot invocation for the changes
> made by these commands to actually have an effect.

Fakeroot environment is not kept between invocations. You should use
-i and -s options of fakeroot command if you want to save/restore
permissions between invocations.
We should provide a path for the savefile in buildroot to handle this
scenario, but from my trials, maintaining consistent such file file is
quite challenging.

Sincerely, Angelo

>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
