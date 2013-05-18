From: Markos Chandras <markos.chandras@gmail.com>
Date: Sat, 18 May 2013 18:58:51 +0100
Subject: [Buildroot] [PATCH] Makefile: Set default emulation for
 MIPS64/MIPS64el n64
In-Reply-To: <20130518193129.47c18aba@skate>
References: <1368819760-11931-1-git-send-email-markos.chandras@gmail.com>
 <20130518193129.47c18aba@skate>
Message-ID: <5197C15B.6000601@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/18/2013 06:31 PM, Thomas Petazzoni wrote:
> Dear Markos Chandras,
> 
> On Fri, 17 May 2013 20:42:40 +0100, Markos Chandras wrote:
>> From: Markos Chandras <markos.chandras@imgtec.com>
>>
>> binutils set the default emulation for MIPS64/MIPS64el to
>> elf32btsmipn32 and elf32ltsmipn3 respectively. This breaks
>> linking for programs calling the linker directly without passing
>> the appropriate emulation parameter (-m). Unfortunately,
>> binutils do not provide a way to set the default emulation when
>> building the linker therefore we export the LDEMULATION variable
>> to set the preferred emulation ourselves. This fixes
>>
>> http://autobuild.buildroot.net/results/0f2a760b94069ac915d856cd1ae1998e5483807a/
>>
>> and possibly other build failures as well.
> 
> I am not sure this is the right fix for the problem. I believe the
> problem is that the external toolchain wrapper should also wrap "ld" in
> order to pass the right arguments to select the correct emulation, just
> like we have a wrapper for "gcc" to select the correct architecture,
> ABI and so on.
> 
> No?
> 
> Thomas
> 
Hi Thomas,

I am not sure what you mean by "external toolchain" here since this is a
problem with the buildroot toolchain as well. I probably don't
understand the solution you propose. This is a "quick and dirty" fix.
The ideal solution to this problem would be to fix the build systems to
use "gcc" instead of "ld" for linking.

-- 
Regards,
Markos Chandras
