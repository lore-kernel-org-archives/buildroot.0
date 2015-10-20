From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 20 Oct 2015 22:53:10 +0200
Subject: [Buildroot] [PATCH] [RFC] linux: add option to avoid kernel
 kconfig updates
In-Reply-To: <1445277739-30943-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1445277739-30943-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <5626A9B6.8080005@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-10-15 20:02, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Some packages require specific kernel options enabled to be of any use,
> however when building a kernel with a specific configuration intended
> for binary-only modules this can be counterproductive.

 Can you give a concrete example of this? The options that we set automatically
should only be options that are really required for building or running. So if
you don't set it, it's not going to work anyway. If there is some option that is
not really required, then we shouldn't be setting it.


 Regards,
 Arnout

> 
> Add an option to disable this behaviour and leave the .config alone.
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
