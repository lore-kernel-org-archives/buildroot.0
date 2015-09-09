From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 9 Sep 2015 11:26:26 +0200
Subject: [Buildroot] [RFC 0/6] mdev-only /dev management (without
 devtmpfs)
In-Reply-To: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
References: <1441747734-18730-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <55EFFB42.2050106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 23:28, Luca Ceresoli wrote:
> There is one rough edge that I'd like to have comments about: variable
> naming. The new method implemented by this patchset is dynamic and uses
> mdev, so it should ba named BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV and
> described in kconfig as "dynamic using mdev". But hey, that name and
> description are already used for the current "devtmpfs + mdev" method! So
> we might want to rename all variables to encompass the new use case in a
> clean way. Thid would also imply lagacy management etc.

 Since we don't like legacy management :-) I'd propose to say that DYNAMIC
actually means DEVTMPFS. So the new option would be called
BR2_ROOTFS_DEVICE_CREATION_MDEV: it's not devtmpfs, and there's no need for the
explicit 'only' part.

 What do you think?

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
