From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Jun 2015 00:27:40 +0200
Subject: [Buildroot] Option for debug support in DirectFB package
In-Reply-To: <55760F79.8080501@openmailbox.org>
References: <55760F79.8080501@openmailbox.org>
Message-ID: <557616DC.5050508@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/08/15 23:56, C?dric Marie wrote:
> Hi,
> 
> DirectFB provides two configure options for debug:
> * --enable-debug (default is no)
> * --enable-debug-support (default is yes)
> The first one enables verbose mode in DirectFB, while the second one
> only provide the functions to print debug information, that might be
> used by an external DirectFB driver.
> 
> When these options are both disabled, the installation path is suffixed
> with -pure (i.e. /usr/lib/directfb-x.y.z-pure instead of
> /usr/lib/directfb-x.y.z).
> 
> Buildroot only gives the possibility to enable/disable the first one
> (with BR2_PACKAGE_DIRECTFB_DEBUG).
> 
> Some external DirectFB driver, when compiled in release mode, would
> expect debug support to be disabled, and would install in the -pure
> suffixed directory.
> 
> Therefore it would be helpful:
> - either to have another option for debug support (and debug option
>   would depend on debug support option, in Config.in)
> - or to disable debug support when debug is disabled: the two options
>   would always be forced to have the same value.
> 
> I believe the first solution is better, but let me know what you
> think... I can provide the patch if you agree with the suggestion.

 That indeed sounds like a good solution. As mentioned by Thomas, the
BR2_PACKAGE_DIRECTFB_DEBUG option will go away, so I'd suggest an option
BR2_PACKAGE_DIRECTFB_DEBUG_SUPPORT that defaults to y.

 Regards,
 Arnout

> 
> That would also prevent DirectFB to compile some useless features
> in release mode.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
