From: Steve Kenton <skenton@ou.edu>
Date: Mon, 12 Jan 2015 10:14:39 -0600
Subject: [Buildroot] [PATCH] dvdauthor : new package
In-Reply-To: <20150112163737.6739827b@free-electrons.com>
References: <54B317DE.9090105@ou.edu>	<20150112092800.08ce4350@free-electrons.com>	<54B3E959.2010504@ou.edu>
 <20150112163737.6739827b@free-electrons.com>
Message-ID: <54B3F2EF.4040304@ou.edu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/12/2015 09:37 AM, Thomas Petazzoni wrote:
> Dear Steve Kenton,
> 
>>>> compilation terminated.
>>>> make[3]: *** [readxml.o] Error 1
>> The build triggers lots of automatic reconfiguration, I guess it must be something on
>> the host side getting rebuilt then. I'll double check while I'm updating the patch.
> 
> Not sure to understand exactly what you mean here.
Messages on a white background of the form >>> package_name Autoreconfiguring

I'm still trying to get my head around the cross build environment with
separate host and target - so I'm not sure *I* understand what I mean :-(

I appreciate the gentle feedback by the way.
> 
> 
>>
>> configure:5176: checking for freetype-config
>> configure:5192: found /usr/bin/freetype-config
> 
> Hu? This does not indicate a host dependency: it indicates that it's
> incorrectly using the host freetype-config, while it should be using
> the one in $(STAGING_DIR). Generally, this is solved by passing some
> ac_cv_path_<foo> variable.
OK, will investigate more

Thanks - Steve
