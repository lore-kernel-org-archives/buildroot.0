From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Mon, 10 May 2021 20:22:15 +0000
Subject: [Buildroot] [PATCH v3 3/4] lmbench: emulate --prefix to avoid
 scattering binaries all over
In-Reply-To: <20210510220931.1dc78bde@windsurf>
References: <20210510180049.61421-1-vgupta@synopsys.com>
 <20210510180049.61421-5-vgupta@synopsys.com>
 <20210510220931.1dc78bde@windsurf>
Message-ID: <e39b28e8-79c9-df44-5113-82af630ebdfb@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 5/10/21 1:09 PM, Thomas Petazzoni wrote:
> On Mon, 10 May 2021 11:00:48 -0700
> Vineet Gupta via buildroot <buildroot@busybox.net> wrote:
>
>>   - moves all lmbench binaries to <target>/lmbench/bin/<ARCH>
>>   - scripts copied to <target>/lmbench/scripts
>>   - scripts/os overwritten to setup "OS" as expected by LMBench runtime scripts
>>
>> Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
> Where are lmbench binaries currently installed? Because /lmbench/ looks
> really really odd as an installation location.

They are currently scattered over in /usr/sbin I think.
Indeed /lmbench is non LSB etc, but it is one stop shop if one wanted to 
remove everything lmbench specific from target rootfs.
I guess one could do /usr/sbin/lmbench/{bin,scripts}

-Vineet
