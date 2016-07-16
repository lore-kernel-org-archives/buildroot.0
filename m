From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sat, 16 Jul 2016 14:44:06 +0200
Subject: [Buildroot] Buildroot, github and nopullrequest.com
Message-ID: <CA+TH9VnO2kF00pQJB3K_f6NcRboq3afw-MmxM1sNHxXWpjdThw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

Personally, I'm really sad that the buildroot infrastructure is
currently down from a few days, buildroot is such a wonderful project
that not merits such a shame.

Obviously, the infrastructure behind buildroot is not up to date to
the current standards, I think we should change.

So, I'm drafting a tentative approach, and I'm sharing it with you.
Obviously I'm not entitled in acting in any way, but hey, can I dream
for a better Buildroot?!

So, we have four aspects here to think about:

1) Website: we have a github account, we have github pages, we should
switch there! The only downside here is that github pages doesn't
suppo SSI, so we should write a simple bash script to assemble the
website before publication. Github pages resides on their own
repository, so we can have the website as always in the main
repository and the bash script will assemble the website in an outside
directory where the other repository it's cloned.

2) We have a github account, we should use it as the main repository.
No other words here.

3) Githb pull requests. Obviously, we won't github pull requests, and
here enters the game https://nopullrequests.com. It's a simple github
webhook that closes a PR with a message. The source is publicly
available on github. We can use that service as is, or run an instance
ourselves on GAE. I had a look at the source code and it's pretty
secure, once it's authorized on github, it receives a message on each
pull requests and replies immediately without keeping anything
(caching or disk). Hosting our instance on GAE will have the benefit
on personalizing the commit message with something more specific than
the pretty aseptic default message.

4) Issues: well, everything is better than bugzilla!

Again, no intention to start a flame war here, only getting a better Buildroot!

Sincerely, Angelo

-- 
Profile: http://it.linkedin.com/in/compagnucciangelo
