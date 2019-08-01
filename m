From: Atharva Lele <itsatharva@gmail.com>
Date: Thu, 01 Aug 2019 16:16:55 +0530
Subject: [Buildroot] [PATCH v4 00/30] builder-class series cover letter
In-Reply-To: <20190801103951.05be1116@windsurf.home>
References: <20190801024643.11024-1-itsatharva@gmail.com>
 <20190801103951.05be1116@windsurf.home>
Message-ID: <1899192.UD1Ciha8BC@msi-manjaro>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday, August 1, 2019 2:09:51 PM IST Thomas Petazzoni wrote:
> Hello Atharva,
> 
> On Thu,  1 Aug 2019 08:16:13 +0530
> 
> Atharva Lele <itsatharva@gmail.com> wrote:
> > Since various functions in the autobuilder script use a lot of common
> > data, we introduce a Builder class to house these variables.
> > 
> > I have also included modified versions of Thomas's commits after adapting
> > them to work with Builder class.
> > 
> > I created a v4 to change the order of one patch, and to delete another
> > patch. No other changes have been made.
> > 
> > RFC: Few patches, namely patches 25, 27-30 have not been reviewed yet. I'd
> > like some feedback on them, if any, so that necessary modifications can
> > be done and it can be merged as soon as possible.
> 
> First of all, thanks a lot for all this work! Nice refactoring of the
> autobuild-run script.

Thank you!

> I merged all patches up to patch 27, included. According to Arnout,
> applying patches 28/29/30 is problematic, because builds done in
> different output directories are currently not reproducible at all, so
> we would simply fail *all* reproducible builds if we apply those
> patches. So I believe we need to fix this before we can apply such
> patches.

Yes, correct.

> A small detail is that patches 28 and 29 should be squashed together:
> patch 28 is only introducing a new variable pointing to the secondary
> output directory, but it's not used anywhere.

OK, so once I'm done with the reproducibility fixes for different output 
directories, I'll send the revised version.

> Also, long term, I'd like the send_results() method to be split into
> several methods. One calculating the failure reason, one deciding if
> the build result should be rejected, one preparing the build results
> for upload, one doing the actual upload. But please don't work on this
> additional refactoring, I think it's much more important that you focus
> on the reproducible build topic.

Of course! I'd love to work on it once majority of work on reproducible builds 
is done.

> Thanks!
> 
> Thomas

Thanks for merging!

Regards,
Atharva Lele
