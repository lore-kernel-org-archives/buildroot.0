From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 16 May 2018 20:42:50 -0500
Subject: [Buildroot] [PATCH v4 5/5] support/scripts/pkgstats: add CPE
 reporting
In-Reply-To: <9f12b13e-44bc-d12b-4a7d-9ba0bd3b5cc3@mind.be>
References: <1525978734-35706-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1525978734-35706-6-git-send-email-matthew.weber@rockwellcollins.com>
 <9f12b13e-44bc-d12b-4a7d-9ba0bd3b5cc3@mind.be>
Message-ID: <CANQCQpYAMxKsMEu7V=hy4CsQYn9EWLkCzFsBB5v+Vfzp6jZrVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, May 16, 2018 at 6:34 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 10-05-18 20:58, Matt Weber wrote:
>> +
>> +        if pkgvar == "LINUX":
>> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
>> +        elif pkgvar == "LINUX_HEADERS":
>> +            Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
>
>  A bit more idiomatic:
>
>         if pkgvar in ("LINUX", "LINUX_HEADERS"):
>             Package.all_cpe_id[pkgvar] = "cpe:2.3:o:" + value + ":*:*:*:*:*:*:*"
>

Noted, will update.

Matt
