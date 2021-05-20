From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 May 2021 08:55:06 +0200
Subject: [Buildroot] [PATCHv2 1/1] package/rustc: add musl as an
 available Rust libc
In-Reply-To: <20210519150145.GZ2268078@scaer>
References: <SJ0PR18MB3898AC687557A2CD4FA0340995599@SJ0PR18MB3898.namprd18.prod.outlook.com>
 <20210518230043.63dc9ac7@windsurf.orange-hotspot>
 <SJ0PR18MB3898F64AF1A5908759597DBE952B9@SJ0PR18MB3898.namprd18.prod.outlook.com>
 <20210519150145.GZ2268078@scaer>
Message-ID: <0c0d1b6d-0707-2b0e-62b7-473ce3d62f49@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/05/2021 17:01, Yann E. MORIN wrote:
>> Do you test the gpg keys and sha256sums "by hand" or is there a
>> utility used when version update commits occur?
> There is no tooling in the Buildroot tree, no. Verifying signatures is
> done manually. In this case, I think Thomas, after downloading all the
> archives and their .asc, basically did:
>     for i in *.asc; do gpg --verify ${i}; done
> 
> But this case is exceptional; usually, there is only one file for which
> to check the hash and signature, not 16! :-)
> 
> Also, I do not usually verify many signatures, since I have almost zero
> connection in the WoT, so verifying a sig does not bring much benefit.

 I do some kind of TOFU because I store the signing key so next time I update
the same package, the signature should match.

 Of course, I rarely update any package, certainly not twice, so the benefit is
limited in my personal case :-)

 Regards,
 Arnout


> But if my download got compromised (maliciously or accidentally), the
> hash I added will be wrong for someone else, especially the autobuilders,
> and we can act on the issue.
> 
> Of course, this does not work if the remote server was compromised, but
> in that case, checking the signatures without a good trust-chain in the
> WoT is useless too...
> 
