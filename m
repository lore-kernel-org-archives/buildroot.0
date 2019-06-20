From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date: Thu, 20 Jun 2019 14:52:50 +0300
Subject: [Buildroot] [PATCH 2/3] package/busybox: convert S10mdev to the
 canonical init script format
In-Reply-To: <5e25ef4f-97c0-0f0e-9fdb-de4c4300086b@railnova.eu>
References: <20190619164257.183607-1-titouan.christophe@railnova.eu>
 <20190619164257.183607-3-titouan.christophe@railnova.eu>
 <20190620101028.GS9224@smile.fi.intel.com>
 <7b16986f-60ed-c07a-5399-7550354086ec@railnova.eu>
 <5e25ef4f-97c0-0f0e-9fdb-de4c4300086b@railnova.eu>
Message-ID: <20190620115250.GV9224@smile.fi.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jun 20, 2019 at 01:39:32PM +0200, Titouan Christophe wrote:
> On 6/20/19 12:44 PM, Titouan Christophe wrote:
> > Hello Andy,
> > 
> > On 6/20/19 12:10 PM, Andy Shevchenko wrote:
> > > On Wed, Jun 19, 2019 at 06:42:56PM +0200, Titouan Christophe wrote:
> > > > Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
> > > 
> > > > -??? find /sys/ -name modalias -print0 | xargs -0 sort -u | tr
> > > > '\n' '\0' | \
> > > > -??????? xargs -0 modprobe -abq
> > > 
> > > > +??? find /sys/ -name modalias -print0 | \
> > > > +??????? xargs -0 sort -u | \
> > > > +??????? tr '\n' '\0' | \
> > > > +??????? xargs -0 modprobe -abq
> > > 
> > > How this indentation change related to the topic?
> > > 
> > 
> > This is a preparatory patch to convert this script to the canonical init
> > script format, as suggested by Arnout (see
> > http://lists.busybox.net/pipermail/buildroot/2019-May/251199.html)
> 
> 
> sorry I did not pay attention to the fact that you were only commenting on
> this particular hunk. I did reindent this command chain for better
> readability (in my opinion); I can rework that part to better suit the
> codestyle, if any.

It should be a separate patch explaining why you are doing that, but not in this one.

-- 
With Best Regards,
Andy Shevchenko
