From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Aug 2016 18:33:35 +0200
Subject: [Buildroot] [RFC 0/2] script to find package licenses
In-Reply-To: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
References: <1470320164-8241-1-git-send-email-rahul.bedarkar@imgtec.com>
Message-ID: <20160804183335.0947f9a9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 4 Aug 2016 19:46:02 +0530, Rahul Bedarkar wrote:

> Legal information is a kind of thing that we can't automate completely.
> But we want it to be correct when new package is added or version bumps.
> 
> This patch set attempts to add a script to find license information from
> package source files to verify or correct legal info for buildroot packages.
> 
> Legal information may get outdated with version bumps or even may not get
> correct in first place if source package does not provide any license files.
> In such cases, we need to look into file header to get that information.
> But it could be very difficult if there are number of source files.
> 
> find-licenses script scans package source files for known licenses to
> find under which license package is released. It aggregates license
> information for all source files found in a package.
> 
> For finding license, we rely on file's license header. Generally
> most of packages use standard license headers which helps us to detect
> license of packages.
> 
> Currently it supports notable licenses. But we can later add other
> licenses based on regx.
> 
> Script outputs licenses found on standard output file-wise, directory-
> wise and final aggregation of all licenses found. It also lists files
> which don't have license header. Directory-wise license listing will be
> useful when different components are licensed under different license.
> 
> Since final license list is just aggregation of licenses found for all
> source files, we can not surely say if package is dual or
> multi-licensed or different components are licensed under different
> license. That's why we can't use final license list directly in our
> package .mk file, but it at least helps us to find or verify license
> information quickly.

Thanks for this proposal. However, there are already some tools that do
the same thing I believe. I'm thinking especially at the tools used by
the Fossology project (https://www.fossology.org/). It is surely more
complicated to install and use that your Python script, but it is also
a lot more complete, and even more importantly: maintained by other
people.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
