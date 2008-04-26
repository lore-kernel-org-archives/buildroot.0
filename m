From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Sat, 26 Apr 2008 15:31:39 +0200
Subject: [Buildroot] Encountered error when building ARM toolchain (sed)
References: <326f33790804242133q559ed57bjcec04560001611f9@mail.gmail.com>
	<326f33790804251043x18a84ea6wbd5ebea1385b206d@mail.gmail.com>
Message-ID: <012a01c8a7a8$73e04100$020514ac@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> Hi everyone,
>>
>> After successfully doing a build for an x86 platform, I am now attempting
>> to build for an ARM platform. After about half an hour into the build
>> process I encountered the error:
>>
>> /root/buildroot/toolchain_build_arm/bin/sed -i -e
>> 's,^EXTRA_VERSION=.*,EXTRA_VERSION==""."4""",g'
>> /root/buildroot/toolchain_build_arm/bin/sed: no input files
>>
>> Does anyone happen to know what this error is referring to? I understand
>> that the editor sed requires an input stream where it performs text
>> transformations, but why am I getting "no input files" here? Is the syntax
>> for the line above that's being passed for sed not correct? Any tips on how
>> to fix this? Thanks a lot for looking into this.
>>
>

Your problem is because you did not specify a valid linux configuration file.
This means that BR2_<xxx>_KCONFIG is empty and 
"sed  <script> $(BR2_<xxx>_KCONFIG)" becomes 
"sed  <script>"

Best Regards
Ulf Samuelsson
