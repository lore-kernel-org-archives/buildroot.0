From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 06 May 2019 21:29:22 +0200
Subject: [Buildroot] [PATCH] package/owfs: delay sysvinit start until
 after network and avahi
In-Reply-To: <20190423113515.6482-1-arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 23 Apr 2019 13:35:15 +0200")
References: <20190423113515.6482-1-arnout@mind.be>
Message-ID: <874l678jql.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > In its default configuration, owserver opens a TCP socket on the 'lo'
 > interface. However, in some situations, the 'lo' interface may not yet
 > be up until S40network is started. This causes owserver not to start its
 > TCP socket, which makes it impossible for the owfs client to connect to
 > it.

 > In addition, owserver may have avahi integration.

 > Therefore, delay the start of owserver and owfs until after S40network
 > and S50avahi-daemon.

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Committed, thanks.

-- 
Bye, Peter Korsgaard
