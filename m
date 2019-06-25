From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 25 Jun 2019 16:20:48 +0200
Subject: [Buildroot] [PATCH 14/19] autobuild-run: move log variable to
 Builder class
In-Reply-To: <20190621084730.16411-14-itsatharva@gmail.com>
References: <20190621084730.16411-1-itsatharva@gmail.com>
 <20190621084730.16411-14-itsatharva@gmail.com>
Message-ID: <b85233ff-35f6-6a07-31cb-680c62c6ac00@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/06/2019 10:47, Atharva Lele wrote:
> Signed-off-by: Atharva Lele <itsatharva@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

[snip]
> +        log_write(self.log, "INFO: preparing a new build")

 Since log_write is now only used within the Builder class, it would be nice to
convert it into a member of that class, so the calls become

        self.log_write("INFO: preparing for a new build")

 But that's really a nice-to-have so don't put it on your priority list :-)

 Regards,
 Arnout

[snip]
