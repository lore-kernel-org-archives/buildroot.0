From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Mon, 22 Sep 2014 16:12:56 -0500
Subject: [Buildroot] RFC: CVE analysis
In-Reply-To: <542088A8.2080902@zacarias.com.ar>
References: <CANQCQpbSu1OUHvivMbQFGC3x6GPSWA3imp2GqGMjeqmYZKBstw@mail.gmail.com>
 <542088A8.2080902@zacarias.com.ar>
Message-ID: <CANQCQpZBHb4kSvP2FRgLEzAE+LmUxaLaE5-C+PCytUUGDzBLnQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gustavo,

On Mon, Sep 22, 2014 at 3:38 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 09/22/2014 05:21 PM, Matthew Weber wrote:
>
>> I was curious if anyone has done a script similar to the "make
>> legal-info" that takes a package list and checks it against a CVE
>> database?  We're looking at doing some automated tracking of
>> vulnerabilities with our nightly builds and were at a point of putting
>> something together.
>>
>> It might also be an interesting feature to expose on the Buildroot
>> website.... maybe listing the current vulnerabilities of the last
>> release and the current tip?
>
> Hi.
> I usually track CVEs and bump/fix when appropiate.
> It's mostly a mix of personal scripts, nothing too fancy that i'd like
> normal people to see in the current state :)

Yeah, we're thinking something simple that lists current CVEs against
whatever the package revision is that's in your current checkout.
Nothing to fancy or automated with respect to updating packages.....

> The problem with actively pursuing security fixes is that it needs some
> regular manpower in patching and testing, and that's without considering
> backports (though the package infra is quite stable lately).
> There are outstanding packages that have some severe vulnerabilities
> like cups where i did a call for volunteers to bump/fix without much
> success, and i can only do so much in my free time, with cups being
> somewhat complicated to test because of varying combinations.
> It's not a task that can really be fully automated either because you
> can get a CVE for say PHP that fixes a vulnerability that only affects
> windows operating systems - there must be some context analysis as well.
> I normally try to maintain some format for my security bumps/fixes but
> that's completely informal, like:

Yeah agree, I hope by automating at least the creation of a CVE list
as part of the build would make it easier to provide the information
to get funding to push updates on packages we use.

>
> Subject: Security bump PACKAGE to version x.y
> Fixes:
> CVE-yyyy-nnnn - short description
>
> But then some other people might catch the bump before myself and there
> goes that.

Maybe it would be beneficial to create a weekly email to the list with
a digest of all package CVEs?  I think there are a couple offline
databases that may make this fairly easy to do (prevent thrashing of
the CVE databases)
     Package, Version, CVE-yyyy-nnnn - short description

>
> Something nicer would probably be like the .hash files for packages
> where we could describe the bumps that affect security and the relevant
> CVEs.

Would it be worth using this also to document if a package needs
updating but hasn't been updated.  Then this could be queried as part
of the build (make cve-info) to generate a summary instead of a
Internet CVE database query.  It would require some automation work to
generate a patch to the list to append to that file that a new CVE was
issued against it though.....  guessing doing that manually isn't
realistic.

Thanks,

-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted
Third Party Intellectual Property (TPIP) content must be encrypted and
sent to matthew.weber at corp.rockwellcollins.com.
