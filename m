From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 23:55:37 +0200
Subject: [Buildroot] [PATCHv3 03/20] package: add a
 <pkg>_EXTRA_DOWNLOADS variable
In-Reply-To: <87wqln4ffj.fsf@dell.be.48ers.dk>
References: <1381256237-27948-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1381256237-27948-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <87wqln4ffj.fsf@dell.be.48ers.dk>
Message-ID: <20131008235537.102caeda@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 08 Oct 2013 23:32:16 +0200, Peter Korsgaard wrote:

>  Thomas> In order to achieve this, we add a <pkg>_EXTRA_DOWNLOADS variable,
>  Thomas> which allows a package to list other stuff it would like to see
>  Thomas> downloaded, but that are otherwise not used by the package
>  Thomas> infrastructure itself: it is up to the package to do it by itself.
> 
> I think it should be possible to support a space seperated list of
> sources in <pkg>_SOURCE, similar to how we do it for <pkg>_PATCH without
> breaking backwards compatibility, but I won't delay this series because
> of it - So committed, thanks.

This has been discussed in a prior version of this patch set. The
problem is that <pkg>_SOURCE is not only about downloading, but also
about extracting.

So, what would <pkg>_SOURCE do? Download all the files listed, but
extract only the first one? This seems like a weird semantic. I think I
prefer the following clear semantic:

 <pkg>_SOURCE is one file, that gets downloaded and then extracted into
 the source directory of the package.

 <pkg>_PATCH is a list of files or URLs, that get downloaded and apply
 as patches into the source directory

 <pkg>_EXTRA_DOWNLOADS is a list of files that get downloaded, and
 nothing else. The package is responsible for doing something with them.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
