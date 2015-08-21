From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 21 Aug 2015 09:07:26 -0500
Subject: [Buildroot] [PATCH v4 2015.08 3/4] Makefile: implement a
 size-stats target
In-Reply-To: <20150820224356.12a399bb@free-electrons.com>
References: <1432591007-27689-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1432591007-27689-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAMQcK5KM=uRUNOZSqu1vieRe4rc5c8+X6WJE5=M_PFxdbo-42w@mail.gmail.com>
 <20150820224356.12a399bb@free-electrons.com>
Message-ID: <CAMQcK5K5RbYUgDgH1VmRE9SSxU=LBEQL=7ph1mnLA2SZokdcCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Thu, Aug 20, 2015 at 3:43 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Ryan,
>
> On Thu, 20 Aug 2015 07:42:39 -0500, Ryan Barnett wrote:
>
>> > +size-stats:
>> > +       $(Q)mkdir -p $(GRAPHS_DIR)
>> > +       $(Q)$(TOPDIR)/support/scripts/size-stats --builddir $(BASE_DIR) \
>> > +               --graph $(BASE_DIR)/graphs/graph-size.$(BR_GRAPH_OUT) \
>> > +               --file-size-csv $(BASE_DIR)/build/file-size-stats.csv \
>> > +               --package-size-csv $(BASE_DIR)/build/package-size-stats.csv \
>> > +               --skeleton-path $(TARGET_SKELETON)
>>
>> In order to make this patch series to continue to work with the recent
>> addition of the skeleton package, the --skeleton-path variable needs
>> to be updated to:
>>
>>    --skeleton-path $(SKELETON_PATH)
>>
>> I don't know if you have already updated this or not in your patch
>> series but this change needs to be in order to have the graph
>> statistics work.
>
> I haven't had the time to update the series unfortunately. However, now
> that the skeleton is a real package, I believe all the special handling
> of the skeleton can be removed from this size-stats mechanism. It will
> simply be handled as a normal package.

Not a problem - we have been pretty thoroughly testing these patches
for the last couple months chasing master. I guess the one thing about
it being handled by being a "package" is there are no files in the
build directory. However, if I remember correctly you size-stats
script monitors the target directory for new files so the skeleton
package would be handled.

Thanks,
-Ryan

-- 
Ryan Barnett / Sr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
ryan.barnett at rockwellcollins.com
www.rockwellcollins.com
