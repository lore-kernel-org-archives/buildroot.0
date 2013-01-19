From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 14:39:51 +0100
Subject: [Buildroot] [PATCH 1/1] httping: new package
In-Reply-To: <20130112120713.59a71794@skate>
References: <y> <1357948846-3710-1-git-send-email-gilles.talis@gmail.com>
 <20130112120713.59a71794@skate>
Message-ID: <50FAA227.6080509@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/13 12:07, Thomas Petazzoni wrote:
>> >  +config BR2_PACKAGE_HTTPING_OPENSSL
>> >  +	bool "OpenSSL support"
>> >  +	default y
>> >  +	select BR2_PACKAGE_OPENSSL
> Here there is a point that is rather unclear in Buildroot:
>
>   *) Should each package offer a configuration sub-option to enable
>      features that depend on other packages (like you did on OpenSSL)
>
>   *) Or should a package automatically enable features if it finds that
>      the dependencies are available? This is generally what we do for
>      packages having an optional dependency on OpenSSL.
>
> This is to be discussed with other Buildroot developers. Probably we
> need to clarify what the rule is, and then document it.

  +1 on the "needs to be documented".

  But for me the rule is fairly clear: if it doesn't significantly 
increase binary size, then it should be selected automatically if available.

  It would be good to add to the package's help text that "SSL support is 
available if the openssl package (in the Libraries -> Crypto menu) is 
selected."


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
