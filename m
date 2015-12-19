From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Dec 2015 15:47:52 +0100
Subject: [Buildroot] [PATCH v2 2/3] package/cal3d: new package
In-Reply-To: <20151219142509.GA3394@free.fr>
References: <1446915053-13783-1-git-send-email-bernd.kuhls@t-online.de>
 <1446915053-13783-3-git-send-email-bernd.kuhls@t-online.de>
 <20151219150027.72263718@free-electrons.com> <20151219142509.GA3394@free.fr>
Message-ID: <56756E18.1090500@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19-12-15 15:25, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-12-19 15:00 +0100, Thomas Petazzoni spake thusly:
>> On Sat,  7 Nov 2015 17:50:52 +0100, Bernd Kuhls wrote:
>>> This package only provides a git submodule for the vsxu package.
>>>
>>> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>>
>> I don't really like the interaction between this package and the vsxu
>> package, but I don't really have a better proposal to be honest.
>>
>> Yann, Peter, Arnout, do you have some suggestions on how to handle such
>> git submodule cases?
[snip]
> Otherwise, for proper git-submodule handling, we would have to do
> (roughly):
> 
>     git clone blabla pkg-version
>     cd pkg-version
>     git checkout pkg-version
>     git submodule update --init --recursive
>     find . -name .git -exec rm -rf {} +
>     cd ..
>     tar czf DL_DIR/pkg-version.tar.gz pkg-version/

 Err, anything wrong with just adding --recursive to the clone command? Or is
that a recent addition? Oh, but git archive still wouldn't add it of course.

 But anyway, in this particular case we're using a github tarball download so it
wouldn't help. Unless it would switch to git download instead.

> 
> This is not very complex, but is stil la significant change from our
> current git wrapper.
> 
> And then, what about svn externals? About Hg subrepos? Does bzr also
> have such a thing?
> 
> Note that I would not really mind doing such a change. But is it worth
> it, given that we currently have only one package that needs submodules?
> Or do we have others for which we had to "deal with it" in a crude way?

 I'm pretty sure there aren't any other packages that need it.

 Regards,
 Arnout

> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
