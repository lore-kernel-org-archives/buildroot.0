From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 2 Sep 2013 23:13:59 +0200
Subject: [Buildroot] [PATCH 4/5] Makefile: do not try to strip
 inexisting file when stripping libpthread
In-Reply-To: <1376996584-4462-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1376996584-4462-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1376996584-4462-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CACXmVib_mJ-TmT22kuPoFHg-pH366Ew-dYDA2zeHHhPp93iuLg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 20, 2013 at 1:03 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> libpthread.so has a special stripping condition to preserve parts of
> it that are needed for debugging. However, due to the usage of 'xargs'
> instead of 'xargs -r', the strip command is executed regardless of
> whether a libpthread.so file is found or not. This leads to a big
> error message being displayed in static-only builds, because strip is
> executed without a file argument. Thanks to the '|| true', the build
> continues, but still shows a big error message in the middle, which is
> not nice.
>
> By using 'xargs -r', we avoid the strip command from being executed
> when 'find' doesn't find any match. We also remove the '|| true' to
> catch other real errors.
>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
