From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 20 Jun 2018 08:55:04 +0200
Subject: [Buildroot] Buildroot git server configuration issue
In-Reply-To: <878t7k8pjk.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Tue, 12 Jun 2018 08:52:31 +0200")
References: <20180612031353.iufmyoec65ocipf4@tarshish>
 <878t7k8pjk.fsf@dell.be.48ers.dk>
Message-ID: <87h8lyne0n.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> Hi Buildroot list,
 >> On my last fetch from the Buildroot git server I got this warning:

 >> remote: warning: unable to access '/root/.config/git/attributes': Permission denied

 >> My origin url is set to git://git.buildroot.net/buildroot.

 > Yes, I started seeing it as well since a few days from the cronjob I
 > have handling the nightly manual generation. I'll investigate.

It is fixed now. The problem was caused by an upgrade / misconfiguration
of xinetd, causing git-daemon (which runs as nobody) to still have the
HOME environment variable pointing to /root.

-- 
Bye, Peter Korsgaard
