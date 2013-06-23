From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Jun 2013 19:06:43 +0200
Subject: [Buildroot] [RFC] post-build scripts: limitations, and proposal
In-Reply-To: <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
References: <20130620213628.GA3534@free.fr>
 <CAAXf6LVO6Rz3RXLW++kOOfaHGRvR_4AB8Mi=VS2S-pKhJSm5Lw@mail.gmail.com>
Message-ID: <51C72B23.2060105@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/06/13 08:17, Thomas De Schampheleire wrote:
> Instead of passing multiple scripts, you could just pass one wrapper
> post build script, without options. This wrapper would be different in
> your different configurations, and would call all relevant scripts in
> turn.

  Or alternatively: a wrapper script that observes $0 and decides which 
other scripts to call based on that. So you'd have
rpi-fixup-rootfs at yem@tvheadend for the one configuration, and
rpi-fixup-rootfs at yem@wpa for the other one.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
