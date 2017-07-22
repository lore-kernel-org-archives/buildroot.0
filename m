From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 22 Jul 2017 15:16:42 +0200
Subject: [Buildroot] [PATCH 07/20] system: move remounting / to the
 corresponding init systems
In-Reply-To: <db57282a925ddcf70a8fca8631ae62347b04c175.1500398733.git.yann.morin.1998@free.fr>
References: <cover.1500398733.git.yann.morin.1998@free.fr>
 <db57282a925ddcf70a8fca8631ae62347b04c175.1500398733.git.yann.morin.1998@free.fr>
Message-ID: <244717f2-3858-c927-c6d9-999489607eb3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 19:25, Yann E. MORIN wrote:
> Currently, remounting / read-write (or not) is done by the skeleton
> package when the init system is eitehr busybox or sysvinit, by
                                  either
> registering a target-finalize hook; it is not done at all for systemd.
> 
> Move registering this target-finalize hook to both of busybox and
> sysvinit. Leave systemd alone, we'll take care of it later.
> 
> Rename the macro to a more meaningful name, and move it to system.mk
> with the other such macros.
> 
> Yet a little bit less init-system knowledge in the skeleton.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

 Small details to fix...

[snip]
> +# Provided by the skeleton package

 Not really, it's provided by system.mk - which is kind of obvious from the
name. So I'd just remove this comment.

> +BUSYBOX_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB

 Excellent choice in variable name!

[snip]
> +# Provided by the skeleton package

 Same here of course.

> +SYSVINIT_TARGET_FINALIZE_HOOKS += SYSTEM_REMOUNT_ROOT_INITTAB
> +
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
