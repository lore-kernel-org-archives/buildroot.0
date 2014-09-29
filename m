From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 29 Sep 2014 12:10:14 -0500
Subject: [Buildroot] [PATCH v2] autobuilder: branch support
In-Reply-To: <20140929185959.16890004@free-electrons.com>
References: <1412002483-43566-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20140929185959.16890004@free-electrons.com>
Message-ID: <CANQCQpaHYXR_94krk7imxVd5ON2p2Pnr3a1s1OsA+MMVXu52DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Mon, Sep 29, 2014 at 11:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Matt Weber,
>
> On Mon, 29 Sep 2014 09:54:43 -0500, Matt Weber wrote:
>> Adds an option to specify a specific repository and branch
>> for the autobuilder to execute against (Defaults to the master
>> branch and mainline repository).
>>
>> Signed-off-by: Matt Weber <Matthew.Weber@rockwellcollins.com>
>
> Thanks for the updated patch. However, I'd like the script to refuse
> pushing results to autobuild.b.o if the repo and branch values are not
> the default ones. So basically, as soon as a login and password are
> passed (which for now indicate submission to autobuild.b.o, because
> it's hardcoded in the script), the branch and repo should be the
> default one.
>
> Maybe something like:
>
> BUILDROOT_DEFAULT_REPO = ...
> BUILDROOT_DEFAULT_BRANCH = master
>
> ...
>
> br_repo = BUILDROOT_DEFAULT_REPO
> br_branch = BUILDROOT_DEFAULT_BRANCH
>
> ... get the config from the command line or config file ...
>
> if br_repo != BUILDROOT_DEFAULT_REPO or br_branch != BUILDROOT_DEFAULT_BRANCH:
>         if http_login and http_password:
>                 print "ERROR: cannot submit test results from foreign branch %s:%s" % (br_repo, br_branch)
>                 sys.exit(1)
>
> or something along those lines.

Sure, sounds good.

<snip>

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
