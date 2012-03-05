From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Mar 2012 10:30:06 +0100
Subject: [Buildroot] [PATCH] pkg-infra: Fix wget -O
In-Reply-To: <1330895423-14763-1-git-send-email-arnout@mind.be>
References: <1330895423-14763-1-git-send-email-arnout@mind.be>
Message-ID: <20120305103006.18e97f0f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun,  4 Mar 2012 22:10:23 +0100,
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> a ?crit :

> wget -O always creates its output file, so we need a different way to
> detect if the download succeeded or not.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

I found the same problem this week-end, and I think that we should
remove the empty file after the download if the download failed. I
don't like having empty files that remain in my download directory.

I will send my version shortly.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
