From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 15 Oct 2016 17:40:06 +0200
Subject: [Buildroot] [PATCH] core/legal-info: allow ignoring packages
 from the legal-info
In-Reply-To: <20161015153246.GG3668@free.fr>
References: <1476538102-8779-1-git-send-email-yann.morin.1998@free.fr>
 <878ttpbq72.fsf@dell.be.48ers.dk> <20161015153246.GG3668@free.fr>
Message-ID: <ce7a11dc-d228-5724-9821-5ef47eb670dc@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 15/10/2016 17:32, Yann E. MORIN wrote:
> Peter, All,
> 
> On 2016-10-15 17:13 +0200, Peter Korsgaard spake thusly:
>>>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>>
>>  > It might be necessary to not even mention a package in the output of
>>  > legal-info:
>>
>>  >   - virtual packages have virtually nothing to save in the legal-info
>>  >     output;
>>
>>  >   - for proprietary packages, it might not even be legal to even
>>  >     mention them, being under NDA or some other such restrictive
>>  >     conditions.
>>
>>  > Introduce the new FOO_GEN_LEGAL_INFO variable that a package can set
>>  > to 'NO' (default to 'YES') to indicate that the package should be
>>  > completely ignored from the legal-info output, in which case the
>>  > package is not mentioned in the maniufest, its source archive,
>>  > patches and license files are not saved into legal-info/ .
>>
>> Couldn't / shouldn't the 2nd part already be handled by
>> <foo>_REDISTRIBUTE = NO and/or <foo>_LICENSE = PROPRIETARY?
> 
> No, because for a proprietary license, you may still have to at least
> list it in the manifest.
> 
> For example, the nvidia-driver package has a proprietary license, is not
> redistributable, but we must still list it in the manifest.
> 
> I'll update the commit log accordingly. Thanks! ;-)

I suggest listing the three possible cases:

 * FOO_GEN_LEGAL_INFO = NO: save nothing
 * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list only
 * FOO_GEN_LEGAL_INFO = YES, FOO_REDISTRIBUTE = NO: list + save source

Maybe in the manual as well?

-- 
Luca
