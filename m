From: Michael Nosthoff <buildroot@heine.tech>
Date: Wed, 14 Oct 2020 17:12:48 +0200
Subject: [Buildroot] [PATCH 0/2] package/systemd: unify journal remote
 options
Message-ID: <20201014151249.18330-1-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

this patch is the result of the discussion at [0] and fixes #12301.

I moved the libqrencode dependency in the first patch for two reasons:
 - it untangles the if-else construct for the remote part
 - in systemd 247 homectl will also be using libqrencode for recovery-keys [1]

In the second patch I deprecated the systemd-journal-gatewayd options as it is
now part of the systemd-journal-remote option. Also since the patch mentioned
in the discussion you already needed to set the latter to get gatewayd built.

[0] http://lists.busybox.net/pipermail/buildroot/2020-October/294477.html
[1] https://github.com/systemd/systemd/blob/master/src/home/homectl-recovery-key.c#L3

Michael Nosthoff (2):
  package/systemd: link libqrencode independent of remote
  package/systemd: group all journal-remote tools

 Config.in.legacy           |  7 +++++++
 package/systemd/Config.in  | 28 ++++++++++++----------------
 package/systemd/systemd.mk | 22 +++++++++-------------
 3 files changed, 28 insertions(+), 29 deletions(-)

-- 
2.25.1
