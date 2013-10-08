From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 08 Oct 2013 23:32:16 +0200
Subject: [Buildroot] [PATCHv3 03/20] package: add a
	<pkg>_EXTRA_DOWNLOADS variable
In-Reply-To: <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 8 Oct 2013 20:17:00 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87wqln4ffj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Converting the external toolchain logic into a package raises a very
 Thomas> special use case that wasn't handled by the package infrastructure:
 Thomas> the Blackfin toolchain is delivered as two tarballs instead of
 Thomas> one. Unfortunately <pkg>_SOURCE only allows to pass one tarball name.

 Thomas> However, we really want both tarballs to be known by the package
 Thomas> infrastructure, so that the normal 'source' and 'external-deps'
 Thomas> mechanism work fine.

 Thomas> In order to achieve this, we add a <pkg>_EXTRA_DOWNLOADS variable,
 Thomas> which allows a package to list other stuff it would like to see
 Thomas> downloaded, but that are otherwise not used by the package
 Thomas> infrastructure itself: it is up to the package to do it by itself.

I think it should be possible to support a space seperated list of
sources in <pkg>_SOURCE, similar to how we do it for <pkg>_PATCH without
breaking backwards compatibility, but I won't delay this series because
of it - So committed, thanks.

-- 
Bye, Peter Korsgaard
