From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 11 Sep 2013 23:04:33 +0200
Subject: [Buildroot] adding users in readonly file system
In-Reply-To: <1378879598226-51085.post@n4.nabble.com>
References: <1378879598226-51085.post@n4.nabble.com>
Message-ID: <5230DAE1.30603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/13 08:06, sajjadi335 wrote:
> Hi
>
> I have searched for a while for this, but have not been able to find
> anything. I am not familiar with how linux manages users. So this might be
> something obvious I don't know.
> My problem is I have an embedded system with a readonly root fs, and I want
> to
> - add a user to the system.
> - Change both the root and the user password.
> How could that be done?

  The users are in /etc/passwd and the passwords in /etc/shadow. If you 
need to be able to modify these at runtime, you can move them to 
$(TARGET_DIR)/tmp in the post-build script and make symlinks to them.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
