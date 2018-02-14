From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 14 Feb 2018 09:02:29 -0200 (BRST)
Subject: [Buildroot] Disable e2fsprogfs utilities chattr and lsattr
In-Reply-To: <CAN+Pz6PQ_2u4AxzmUYFmihD1Vfbo1cq14CKHyK9xzN5i_7u18g@mail.gmail.com>
References: <CAN+Pz6N=Artes_iA=aDj+Dd_yfLQw1QM8_iFKgEiLQVLfM+5jQ@mail.gmail.com>
 <CAN+Pz6PQ_2u4AxzmUYFmihD1Vfbo1cq14CKHyK9xzN5i_7u18g@mail.gmail.com>
Message-ID: <135394184.139988.1518606149517.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Gani Suresh" <sureshgani@gmail.com>
> To: "buildroot" <buildroot@busybox.net>, "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> Sent: Thursday, February 1, 2018 10:23:08 PM
> Subject: Re: [Buildroot] Disable e2fsprogfs utilities chattr and lsattr

> On Tue, Jan 30, 2018 at 10:17 PM, Gani Suresh < [ mailto:sureshgani@gmail.com |
> sureshgani at gmail.com ] > wrote:

>> We have a requirement to avoid the vulnerability of our system. So, we are
>> planning to disable chattr and lsattr when e2fsprogs package is built.

Extended attributes belong to the filesystem and will still be there
regardless the absence of the corresponding userland utilities. Why
could the presence of chattr and lsattr be considered a vulnerability?

>> Until, e2fsprogs version 1.43.1 these utilities were optional in building i.e.
>> there were separate build flags( e.g BR2_PACKAGE_E2FSPROGS_CHATTR ) to
>> enable/disable the same. In below, commit these flags were removed to enable
>> these utilities by default. Then, we can remove the binaries in our post
>> installation processing. Please clarify our question below.

Please read carefully the commit message see the discussion in the
bug report:

    https://bugs.busybox.net/show_bug.cgi?id=9436

>> Are these utilities used by the binaries built as part of e2fsprogs package or
>> some other programs ? If so, what is the impact of removing these binaries from
>> the target ?

They are normally used by user scripts. Other e2fsprogs utilities do
not use them.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
