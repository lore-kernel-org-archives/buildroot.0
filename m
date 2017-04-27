From: Ricardo Martincoski <ricardo.martincoski@datacom.ind.br>
Date: Thu, 27 Apr 2017 14:52:56 -0300 (BRT)
Subject: [Buildroot] [PATCH] Restore .git directory in git package
 downloads
In-Reply-To: <20170426041048.xsxovkh53dhcif4l@sapphire.tkos.co.il>
References: <1492574439-4617-1-git-send-email-james@balean.com.au>
 <58f7f1456cc7e_21d33f8c269493f44696f@ultri3.mail>
 <20170420034025.kcbpz3nrhn3yylin@tarshish>
 <1493178739-21234-1-git-send-email-james@balean.com.au>
 <20170426041048.xsxovkh53dhcif4l@sapphire.tkos.co.il>
Message-ID: <682867300.20794745.1493315576819.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch, James,

On Wednesday, April 26, 2017 1:10:48 AM, Baruch Siach wrote:
> Hi James,
> 
> On Tue, Apr 25, 2017 at 10:52:19PM -0500, James Balean wrote:
>> On 20 April 2017 at 09:22, Ricardo Martincoski
>>   <ricardo.martincoski@gmail.com> wrote:
>> > - it would make the tarballs for git packages not reproducible as the
>> > contents now depend on the state of the remote server (i.e. in some
>> > cases a full clone is needed; assume a tarball is generated, then a
>> > new commit is created in the remote server in any branch, a new full
>> > clone with the same reference as version would include that new commit
>> > and therefore the tarball is different);
>> 
>> Isn't it already the case that git tarballs are not reproducible? For
>> example, after a tarball is generated from a clone of 'master' or a tag,
>> Buildroot doesn't check and re-clone when changes are made to the branch
>> or tag on subsequent builds.
> 
> For this reason we only use immutable git references (either commits ids or
> tags) for git downloaded <PKG>_VERSION.
> 
>> Additionally, the same tarball filename is
>> also used for a full clone if a shallow clone fails. So tarballs can
>> already differ markedly between users.
> 
> The content of the source tree should be the same for a given git reference,
> regardless of the clone type.

Indeed. Tarballs for git packages are already reproducible.

> Buildroot has been verifying git generated tarballs using hashes in
> packages/<pkg>/<pkg>.hash files for some time now without an issue, AFAIK.

Not yet, but we are almost there, see
http://patchwork.ozlabs.org/patch/741360/

Regards,
Ricardo
