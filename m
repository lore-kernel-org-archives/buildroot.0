From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 26 Jun 2018 09:13:28 +0200
Subject: [Buildroot] [PATCH 1/1] pkg-generic: fix no-check-hash for
 inferred site method
In-Reply-To: <5b319e6ca0af0_7d0f2ae8223913c422165@ultri5.mail>
References: <390b1691-6548-abfd-50de-cb642d692b03@lucaceresoli.net>
 <5b319e6ca0af0_7d0f2ae8223913c422165@ultri5.mail>
Message-ID: <b4810fec-1b32-60f1-6559-253075cc7d65@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ricardo,

On 26/06/2018 04:01, Ricardo Martincoski wrote:
> Hello,
> 
> On Mon, Jun 25, 2018 at 06:01 PM, Luca Ceresoli wrote:
> 
>> On 25/06/2018 03:41, Ricardo Martincoski wrote:
>>> Currently, when the site method is explicitly set to a SCM other than
>>> git, the main download is correctly excluded from being hash-checked.
>>> But when the site method is inferred from the site uri, the download
>>> from a SCM other than git is wrongly being hash-checked.
> [snip]
>>> ---
>>> All packages in the tree that use those site methods currently
>>> explicitly set the site method.
>>> $ make -s printvars VARS=%_SITE_METHOD | grep '=\(bzr\|cvs\|hg\|svn\)'
> [snip]
>>> PYTHON_PYGAME_SITE_METHOD=hg
>>
>> Apologies, but I couldn't understand what this commit is supposed to
>> fix. From your description above I understand you're fixing packages
>> whose method is inferred (i.e. not explicitly set). But here you list
> 
> I am fixing packages whose method is inferred.
> 
>> packages which explicitly set it.
> 
> Sorry. My message after the commit log was misleading.
> Rethinking now, a better message would be:
> "Currently there is no package in the tree that uses inferred site method, and
> that is why the autobuilder didn't caught this. We had packages using inferred
> site method in the past, the last one was 'expect', but since they didn't have a
> hash file (for a license or extra-download for example) the build didn't error
> out."

Ok, thanks for the detailed explanation. I would append the above
paragraph to the existing message, just before the SoB line. If you
resubmit with this change, you can add my:

 Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
 Tested-by: Luca Ceresoli <luca@lucaceresoli.net>

Bye,
-- 
Luca
