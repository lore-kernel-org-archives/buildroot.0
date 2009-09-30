From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Wed, 30 Sep 2009 10:13:22 +0200
Subject: [Buildroot] multiple architectures
In-Reply-To: <20090930090102.0189852d@surf>
References: <20090930062658.GG25852@moomers.org> <20090930090102.0189852d@surf>
Message-ID: <5f2b60909300113o53ef97b7j6910562af6ebb8be@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2009/9/30 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Le Wed, 30 Sep 2009 01:26:58 -0500,
> Igor Serebryany <igor47@moomers.org> a ?crit :
>
>> ? ? ? I need both an x86 and an amd64 version of my buildroot
>> filesystem and kernel. I've been making this happen by a very
>> inefficient process - keeping two copies of the buildroot source (one
>> for each arch), making local/projectname an svn working copy, making
>> all changes to the x86 version and using 'svn update' to merge changes
>> ? ? ? back into the amd64 version.
>>
>> ? ? ? I'm sure there must be a better way. How do people on here
>> manage maintaining identical builds for multiple architectures?
>
> Use out-of-tree compilation with O=, with two different configurations
> files.

How about that the default BR output directory contains an arch
postfix? This would eliminate the need for manually setting O=
according to the current .config. Instead it would happen
automatically.

Any thoughts?

Regards,
Bj?rn Forsman
