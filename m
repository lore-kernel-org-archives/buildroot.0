From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Oct 2013 11:29:02 +0200
Subject: [Buildroot] [PATCHv3 03/20] package: add a
	<pkg>_EXTRA_DOWNLOADS variable
In-Reply-To: <20131008235537.102caeda@skate> (Thomas Petazzoni's message of
 "Tue, 8 Oct 2013 23:55:37 +0200")
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87wqln4ffj.fsf@dell.be.48ers.dk> <20131008235537.102caeda@skate>
Message-ID: <87siwa4wtd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> I think it should be possible to support a space seperated list of
 >> sources in <pkg>_SOURCE, similar to how we do it for <pkg>_PATCH without
 >> breaking backwards compatibility, but I won't delay this series because
 >> of it - So committed, thanks.

 Thomas> This has been discussed in a prior version of this patch set. The
 Thomas> problem is that <pkg>_SOURCE is not only about downloading, but also
 Thomas> about extracting.

 Thomas> So, what would <pkg>_SOURCE do? Download all the files listed,
 Thomas> but extract only the first one? This seems like a weird
 Thomas> semantic. I think I prefer the following clear semantic:

 Thomas>  <pkg>_SOURCE is one file, that gets downloaded and then extracted into
 Thomas>  the source directory of the package.

 Thomas>  <pkg>_PATCH is a list of files or URLs, that get downloaded and apply
 Thomas>  as patches into the source directory

 Thomas>  <pkg>_EXTRA_DOWNLOADS is a list of files that get downloaded,
 Thomas>  and nothing else. The package is responsible for doing
 Thomas>  something with them.

Well, I don't feel strongly about it, but no matter what we do packages
with multple sources will be "special" (Luckily they are very uncommon),
so you always have to do something explicit to use (extract) the extra
sources.

But I don't particulary find a special _EXTRA_DOWNLOADS any cleaner than
just saying that only the first element in _SOURCE will be automatically
extracted.

-- 
Bye, Peter Korsgaard
