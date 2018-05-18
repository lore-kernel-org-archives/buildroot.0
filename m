From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Fri, 18 May 2018 08:05:54 -0500
Subject: [Buildroot] [PATCH v5 6/7] support/scripts/pkg-stats: add CPE
 reporting
In-Reply-To: <20180518091346.40263aea@windsurf>
References: <1526613200-48452-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1526613200-48452-7-git-send-email-matthew.weber@rockwellcollins.com>
 <20180518091346.40263aea@windsurf>
Message-ID: <CANQCQpZfPRD0nxZp9BDrD8w2+_kbwvNvfnJ2=_v7g0UJ=SYtDg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Fri, May 18, 2018 at 2:13 AM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Thu, 17 May 2018 22:13:19 -0500, Matt Weber wrote:
>
>>      packages = get_pkglist(args.npackages, package_list)
>> -    print "Getting package make info ..."
>> +    print("Getting package make info ...")
>>      package_init_make_info()
>> -    print "Getting package details ..."
>> +    print("Getting package details ...")
>>      for pkg in packages:
>>          pkg.set_infra()
>>          pkg.set_license()
>> @@ -517,9 +584,10 @@ def __main__():
>>          pkg.set_patch_count()
>>          pkg.set_check_package_warnings()
>>          pkg.set_current_version()
>> -    print "Calculate stats"
>> +        pkg.set_cpe_info(cpedb)
>> +    print("Calculate stats")
>>      stats = calculate_stats(packages)
>> -    print "Write HTML"
>> +    print("Write HTML")
>
> I hate silly reviews, and this is a silly review, but this change to
> use parenthesis in print calls is not related to introducing CPE
> support, so it should be a separate patch (which I could merge sooner
> and separately from the CPE discussion).

Noted, Ricardo had mentioned similar.  See below.
http://patchwork.ozlabs.org/patch/916300/

Matt
