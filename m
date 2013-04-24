From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 24 Apr 2013 14:44:56 +0200
Subject: [Buildroot] [PATCH 0/4] Wayland/weston packages
In-Reply-To: <20130424042732.2cbfdc43@skate>
References: <1366646873-26196-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5175ACB8.4060405@mind.be> <20130424042732.2cbfdc43@skate>
Message-ID: <5177D3C8.8020309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 24/04/13 04:27, Thomas Petazzoni wrote:
> Dear Arnout Vandecappelle,
>
> On Mon, 22 Apr 2013 23:33:44 +0200, Arnout Vandecappelle wrote:
>
>>    Maybe moving it into "X libraries and helper libraries" is more
>> relevant? I expect that other packages (mesa3d?) may also move there.
>
> Good idea. However, it means that we have from package/Config.in an
> include to a Config.in in package/x11r7/<foo>/Config.in:
>
> diff --git a/package/Config.in b/package/Config.in
> index ab514c7..3a19243 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -155,6 +155,7 @@ source "package/x11r7/Config.in"
>   comment "X libraries and helper libraries"
>   source "package/liberation/Config.in"
>   source "package/libsexy/Config.in"
> +source "package/x11r7/xkeyboard-config/Config.in"
>
> Does it matter, or should I also move the xkeyboard-config directory
> outside of package/x11r7/ ?

  If it no longer depends on xorg7, I would vote to move it out.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
