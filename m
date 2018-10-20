From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Oct 2018 01:48:12 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/nss-mdns: Fix hook from
 post-install to finalize
In-Reply-To: <1527580812-14078-1-git-send-email-vincent.prince.fr@gmail.com>
 (Vincent Prince's message of "Tue, 29 May 2018 10:00:11 +0200")
References: <87wovnv81q.fsf@dell.be.48ers.dk>
 <1527580812-14078-1-git-send-email-vincent.prince.fr@gmail.com>
Message-ID: <87mur889j7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Prince <vincent.prince.fr@gmail.com> writes:

 > Both nss-mdns and nss-myhostname patch nsswitch.conf file
 > so it needs to be done at the final stage otherwise changes are not applied

 > Signed-off-by: Vincent Prince <vincent.prince.fr@gmail.com>

We also need to rewrite the sed invocation so the order between
toolchain / nss-mdns / nss-myhostname doesn't matter. I've added 2
followup patches to do that and committed, thanks.

-- 
Bye, Peter Korsgaard
