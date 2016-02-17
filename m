From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 18 Feb 2016 00:44:00 +0100
Subject: [Buildroot] [PATCH v9 1/1] package/dhcp: bump version to
	4.3.3-P1
In-Reply-To: <1455677124-21497-1-git-send-email-rdkehn@yahoo.com>
References: <1455677124-21497-1-git-send-email-rdkehn@yahoo.com>
Message-ID: <56C505C0.40306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17-02-16 03:45, Doug Kehn wrote:
> bind source tar-ball is now embedded into the dhcp source. The embedded
> bind tar-ball is extracted after the dhcp source so cross compiling
> patches can be applied to the dhcp and bind before the package is built.
> 
> The embedded bind configure is called as part of dhcp make instead of
> dhcp configure; therefore, needed configure parameters are set in the
> make env.
> 
> 0001-dhcp-cross-compile.patch and 0002-bind-cross-compile.patch have
> been submitted upstream as part of a cross compiling enhancement
> suggestion to dhcp-suggest at isc.org. Reference ISC-Bugs #41502.
> 0003-bind-hos-cc.patch is already scheduled for the next dhcp release.
> 
> Buildroot thread
> 	http://lists.busybox.net/pipermail/buildroot/2016-January/149079.html
> has related information.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I'm still not sure if it wouldn't be better to call the bind configure in a
post-configure hook, but this is definitely simpler and anyway we do the same
for e.g. gcc.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
