From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 25 Jun 2020 13:18:16 +0200
Subject: [Buildroot] [RFC v9 08/10] support/scripts/cpe-report: new
 script
In-Reply-To: <20200616170341.45098-8-matthew.weber@rockwellcollins.com>
References: <20200616170341.45098-1-matthew.weber@rockwellcollins.com>
 <20200616170341.45098-8-matthew.weber@rockwellcollins.com>
Message-ID: <20200625131816.06be795b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 16 Jun 2020 12:03:39 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> The script supports looking up all the CPEs provided in a
> make cpe-info csv file export from a target Buildroot build.
> It checks the current version and suggests a CPE needs update
> or possibly an initial submission is required to NIST.
> 
> Adds option to allow alternate locations for the dictionary
> URL and caching of a processed dictionary to speed up execution.
> 
> Outputs a cpe/ folder with propsed xml generated from the
> dictionary contents to propose updated versions to NIST.
> 
> For missing CPE matches, a cpe-report-missing.txt is created
> by the script that can be used later to manually create proposed
> new NIST dictionary entries.
> 
> Ref: NIST has a group email (cpe_dictionary at nist.gov) used to
> recieve these version update and new entry xml files.  They do
> process the XML and provide feedback. In some cases they will
> propose back something different where the vendor or version is
> slightly different.
> 
> Limitations
>  - Currently any use of non-number version identifiers isn't
>    supported by NIST as they use ranges to determine impact
>    of a CVE
>  - Any Linux version from a non-upstream is also not supported
>    without manually adjusting the information as the custom
>    kernel will more then likely not match the upstream version
>    used in the dictionary
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

At this point, I am not really clear what this script does. Indeed,
what I would have initially expected is a script that based on the
"show-info" output, tells the user what are the known unfixed CVEs
affecting his configuration. But this is not what this cpe-report
script is doing.

I am not sure to understand what are the CPE updates that this script
generates ? Does the NVD database needs to know about all versions of
all software components ? I though the database was indexed by CVE, and
then provided for each CVE the range of versions of the software
component affected by that CVE.

Could you clarify a bit the whole process, and what are those "CPE
updates" sent to NIST useful for ?

> +CPE_XML_URL = "https://static.nvd.nist.gov/feeds/xml/cpe/dictionary/official-cpe-dictionary_v2.3.xml.gz"

Or perhaps this "dictionary" is not about CVEs, but about listing all
versions of all software components ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
