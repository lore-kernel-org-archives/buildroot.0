From: =?UTF-8?Q?I=c3=b1igo_Huguet?= <inigohuguet@fanamoel.com>
Date: Mon, 5 Nov 2018 08:52:02 +0100
Subject: [Buildroot] [PATCH 1/1] picotts: new package
In-Reply-To: <20181102221146.4884a16b@windsurf>
References: <20181023082513.30099-1-inigohuguet@fanamoel.com>
 <20181102221146.4884a16b@windsurf>
Message-ID: <1e8836fe-f499-1067-c2a0-9c7e0821af6a@fanamoel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, some comments below.


El 02/11/18 a las 22:11, Thomas Petazzoni escribi?:
>> to help with that:
>>   - picotts: create the output wav file in /tmp, play it with aplay
>>     and delete it
>>   - picotts-lc: detect the current system language and call picotts
>>     script
> However, I am not convinced that we want those helper scripts. They
> seem to be pretty use case specific, and it's not really the point of
> Buildroot to carry this type of script IMO. If you think they are
> generally useful, then talk with upstream to get them merged.

The problem is that there is no upstream anywhere. This program source 
was "extracted" from Android source, but there is not any "official" 
team maintaining it. Actually, I got the source code from Ubuntu's 
package and uploaded it to my own github.

About the scripts being use case specific, I think they're not. The 
program only can create a .wav file, so if you want to use it to make 
"on the fly" speech, you need to create a temporary wav, play it, and 
delete it. This is in fact what the helper scripts do.

I you think they must be removed I will do it, please tell me exactly 
what to do. Or, since the repository from which the package download the 
program is mine, I can include them to my repo directly.

> Please add a blank line, and then the upstream URL of the project.

Same problem, there is not any upstream URL.

>> +# generate build files (autotools)
>> +PICOTTS_PRE_CONFIGURE_HOOKS += PICOTTS_EXEC_AUTOGEN
>> +define PICOTTS_EXEC_AUTOGEN
>> +	cd $(@D) && ./autogen.sh
>> +endef
> This won't work correctly, because you're not adding host-autoconf,
> host-automake and host-libtool in dependencies.
>
> Could you use PICOTTS_AUTORECONF = YES instead? If it doesn't work,
> could you give more details at what doesn't work?

It will work if I just add those packages as dependencies? I will also 
try with autoreconf, I didn't do it because I don't know enough about 
how autotools works to know if there is any important difference or not.

> Could you rework the package to take into account those comments, and
> send an updated version ?
>
> Thanks a lot!
>
> Thomas

Of course, I can.

Regards

I?igo
