From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 17 Sep 2010 13:32:38 -0500
Subject: [Buildroot] How to rebuild the kernel only
In-Reply-To: <4C93AD57.1020604@googlemail.com>
References: <4C93A950.90901@signaturealpha.com>
	<4C93AD57.1020604@googlemail.com>
Message-ID: <0D753D10438DA54287A00B02708426976444F1D861@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday, September 17, 2010 11:03 AM, Marcus Osdoba wrote:
>  Am 17.09.2010 19:45, schrieb Marc Leclerc:
>>  Hi,
>>
>> any option to only rebuild the kernel (bsImage) ?
>>
> Yes. Outside buildroot ;-)
> It's not possible to make clean and compile ONLY the kernel afterwards. 
> The whole selected userland and/or toolchains will be rebuilt.
> It is of course possible to download the kernel sources and bake the 
> kernel yourself on your host.

Actually, it used to work by doing a:

$ make linux26-force;make

But the -force target was removed awhile back.

I have been working around that lately by doing a:

$ touch output/build/linux-{version}/.stamp_configured;make

Make sure {version} is correct for your system.

Regards,
Hartley
