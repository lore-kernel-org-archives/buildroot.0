From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 May 2018 01:34:18 +0200
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
References: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <9f12b13e-44bc-d12b-4a7d-9ba0bd3b5cc3@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10-05-18 20:58, Matt Weber wrote:
> +
> +        if pkgvar == "LINUX":
> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
> +        elif pkgvar == "LINUX_HEADERS":
> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"

 A bit more idiomatic:

        if pkgvar in ("LINUX", "LINUX_HEADERS"):
            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"

 Regards,
 Arnout

> +        else:
> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:a:" + value + ":*:*:*:*:*:*:*"

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
