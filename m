From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Dec 2015 09:23:11 +0100
Subject: [Buildroot] [psa] various server software upgrades
In-Reply-To: <8737ver8lr.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Mon, 07 Dec 2015 09:00:48 +0100")
References: <20151202073542.GY23754@vapier.lan>
 <20151206214229.GE4023@free.fr> <87610bs0dv.fsf@dell.be.48ers.dk>
 <20151207015525.GH23754@vapier.lan> <8737ver8lr.fsf@dell.be.48ers.dk>
Message-ID: <87twnupt00.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > remote: ssl.CertificateError: hostname 'git.busybox.net' doesn't match 'git.buildroot.org'
 > To ssh://buildroot.net/var/lib/git/buildroot.git
 >    f8daafd..1682aee  master -> master

FYI, it seems to be because of the redirects:

http://git.buildroot.{org,net} redirects to https://git.busybox.net but
certificate is for git.buildroot.org

https://git.buildroot.org is ok

https://git.buildroot.net is nok as certificate is only for
git.buildroot.org

-- 
Bye, Peter Korsgaard
