From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Sep 2014 17:38:00 -0300
Subject: [Buildroot] RFC: CVE analysis
In-Reply-To: <CANQCQpbSu1OUHvivMbQFGC3x6GPSWA3imp2GqGMjeqmYZKBstw@mail.gmail.com>
References: <CANQCQpbSu1OUHvivMbQFGC3x6GPSWA3imp2GqGMjeqmYZKBstw@mail.gmail.com>
Message-ID: <542088A8.2080902@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/22/2014 05:21 PM, Matthew Weber wrote:

> I was curious if anyone has done a script similar to the "make
> legal-info" that takes a package list and checks it against a CVE
> database?  We're looking at doing some automated tracking of
> vulnerabilities with our nightly builds and were at a point of putting
> something together.
> 
> It might also be an interesting feature to expose on the Buildroot
> website.... maybe listing the current vulnerabilities of the last
> release and the current tip?

Hi.
I usually track CVEs and bump/fix when appropiate.
It's mostly a mix of personal scripts, nothing too fancy that i'd like
normal people to see in the current state :)
The problem with actively pursuing security fixes is that it needs some
regular manpower in patching and testing, and that's without considering
backports (though the package infra is quite stable lately).
There are outstanding packages that have some severe vulnerabilities
like cups where i did a call for volunteers to bump/fix without much
success, and i can only do so much in my free time, with cups being
somewhat complicated to test because of varying combinations.
It's not a task that can really be fully automated either because you
can get a CVE for say PHP that fixes a vulnerability that only affects
windows operating systems - there must be some context analysis as well.
I normally try to maintain some format for my security bumps/fixes but
that's completely informal, like:

Subject: Security bump PACKAGE to version x.y
Fixes:
CVE-yyyy-nnnn - short description

But then some other people might catch the bump before myself and there
goes that.

Something nicer would probably be like the .hash files for packages
where we could describe the bumps that affect security and the relevant
CVEs.

Regards.
