From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 11 Sep 2020 09:21:39 +0200
Subject: [Buildroot] CVE analysis of the resiprocate package
In-Reply-To: <20200909235739.4ccaa8b6@windsurf.hq.k.grp>
References: <20200907071032.C7EB26064C@crulimr02.rockwellcollins.com>
 <CAMQcK5KyWBPOW7s9BD7xaE5nd15SzEARFf8sDm9aYq=E6bqVbA@mail.gmail.com>
 <20200909235739.4ccaa8b6@windsurf.hq.k.grp>
Message-ID: <87zh5wvkvw.fsf@BL-laptop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

> Hello Ryan,
>
> +Gr?gory in Cc.
>
> On Wed, 9 Sep 2020 16:32:08 -0500
> Ryan Barnett <ryan.barnett@collins.com> wrote:
>
>> It appears that there may be an issue with how the CVE scanning script
>> is working with buildroot as it is detecting that there is a CVE
>> vulnerability with resiprocate package when the version which is in
>> buildroot 1.12.0 includes this CVE fix as described in the debian
>> security tracker and in the nvd.nist.gov website:
>> 
>> https://nvd.nist.gov/vuln/detail/CVE-2017-9454
>> 
>> Does the automated script not handle the minor version such as "beta"
>> or "alpha" which is present in some of the versions listed in the
>> nvd.nist.gov website?
>> 
>> I'm not familiar with the scripts and don't have time to dig into it
>> but I feel like there is something missing here as I don't believe the
>> right fix to is put the IGNORE_CVE for this one in the package.
>
> Thanks for pointing the issue. It's precisely by having such reports
> that we can progressively improve our CVE tooling.
>
> The JSON blurb describing the configurations for this CVE is:
>
>     "configurations" : {
>       "CVE_data_version" : "4.0",
>       "nodes" : [ {
>         "operator" : "OR",
>         "cpe_match" : [ {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:*:*:*:*:*:*:*:*",
>           "versionEndIncluding" : "1.10.2"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha1:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha10:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha11:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha2:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha3:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha4:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha5:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha6:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha7:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha8:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:alpha9:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta1:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta2:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta3:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta4:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.11.0:beta5:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:alpha1:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta1:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta2:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta3:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta4:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta5:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta6:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta7:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta8:*:*:*:*:*:*"
>         }, {
>           "vulnerable" : true,
>           "cpe23Uri" : "cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta9:*:*:*:*:*:*"
>         } ]
>       } ]
>     },
>
> So indeed, I guess the problem is that in
> cpe:2.3:a:resiprocate:resiprocate:1.12.0:beta9:*:*:*:*:*:*, we don't
> see the "beta9", and only "1.12.0".
>
> I'm not sure how to use that though. Ignore when the "minor" version is
> not "*" ?
>
> Perhaps what we need to do is a run of pkg-stats on all packages/CVEs,
> and see how many CVEs have non "*" minor versions. This will give us
> some idea of the scope of the issue.
>
> Gr?gory, do you think you could have a look into this ?

I am going to generate the list.

Gregory

>
> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
