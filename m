From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 18 Jan 2014 16:53:05 +0100
Subject: [Buildroot] [PATCH 5/6] pkg-infra: add possiblity to check
 downloaded files against known hashes
In-Reply-To: <20140117224136.GE3982@free.fr>
References: <cover.1389569992.git.yann.morin.1998@free.fr>
 <dc5d6ba62805a74ef57fc2c779e97a00056cbfa6.1389569992.git.yann.morin.1998@free.fr>
 <52D5AE11.60804@mind.be> <20140114233438.GL3328@free.fr>
 <52D64559.90705@mind.be> <20140117224136.GE3982@free.fr>
Message-ID: <52DAA361.8040100@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, Arnout,

Yann E. MORIN wrote:
> Arnout, All,
>
> On 2014-01-15 09:22 +0100, Arnout Vandecappelle spake thusly:
>> On 15/01/14 00:34, Yann E. MORIN wrote:
>>> Arnout, All,
>>>
>>> On 2014-01-14 22:37 +0100, Arnout Vandecappelle spake thusly:
>>>> On 13/01/14 00:44, Yann E. MORIN wrote:
>> [snip]
>>>>> Note-2: The laternative to sha1 would be sha2 (256- or 512-bit), but
>>>>> oldish "enterprise-class" distributions  may be missing them entirely.
>>>>> sha256sum and sha512sum were added to coreutils in 2005-10-23, and RHEL5
>>>>> seems to have them. But better be safe than sorry. If sha2 should be
>>>>> considered instead of sha1, then it is very easy to switch now. Switching
>>>>> later would require that we revalidate all packages that have hashes,
>>>>> which could prove to be quite time-demanding if we have lots of
>>>>> packages using hashes.
>>>>
>>>>   We can be more future-safe by storing the hash that is used in the .hash
>>>> file itself.
>>>
>>> Hu?
>>
>>   If the hash file contains the following:
>>
>> 486fb55c3efa71148fe07895fd713ea3a5ae343a  sha1  libfoo-1.2.3.tar.bz2
>
> OK, I see what you meant, now.
>
>> then you can now let the script check that the second field is sha1, and
>> later you can support different hash methods. In that case, it is not
>> necessary to update all the files when we want to switch to a new hash
>> method.
>
> However, that means the file is no longer the output of:
>      sha1sum files-to-check* >package.hash
>
> or of any other hash utility: sha*sum all generates similarly-formatted
> outputs:
>      hash <two spaces> filename
>
> Which was the reason I choose that format.
>
> If we'd use your suggestion, we'd need a simple way to generate that
> file, or it'd be error prone.

Or keep in BR one file per each hash algorithm: a *.hash.sha1
file, a *.hash.sha256 file etc. Whichever file(s) are found are
checked.

This would save both needs, wouldn't it? It should not take many more
lines of code to implement.

-- 
Luca
