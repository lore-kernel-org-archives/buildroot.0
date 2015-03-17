From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 17 Mar 2015 14:20:48 +0100
Subject: [Buildroot] [PATCH] lua-periphery: disable for MIPS
	architectures
In-Reply-To: <20150317130949.56e4d0c3@free-electrons.com>
References: <1426592859-46907-1-git-send-email-Vincent.Riera@imgtec.com>
 <20150317130949.56e4d0c3@free-electrons.com>
Message-ID: <55082A30.9070809@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 17/03/15 13:09, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
> 
> On Tue, 17 Mar 2015 11:47:39 +0000, Vicente Olivert Riera wrote:
>> c_ispeed and c_ospeed are not available for MIPS:
>>
>> src/serial.c:191:25: error: 'struct termios' has no member named 'c_ispeed'
>>          termios_settings.c_ispeed = baudrate;
>>
>> src/serial.c:192:25: error: 'struct termios' has no member named 'c_ospeed'
>>          termios_settings.c_ospeed = baudrate;
>>
>> Fixes:
>>
>>   http://autobuild.buildroot.net/results/ca7146661c8135568be90dd53b6ee569ebff270d/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> I think disabling on MIPS is not the right fix. The right fix is to use
> the C library cfsetispeed() and cfsetospeed() instead of directly
> accessing the termios structure members, which are not guaranteed to
> exist.

thanks for the advice. I have sent a pull request after testing it fixes
the problem. Let's see what happens :-)

https://github.com/vsergeev/c-periphery/pull/1

Best regards,
--
Vincent

> Thomas
> 
