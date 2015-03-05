From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 5 Mar 2015 09:14:43 +0100
Subject: [Buildroot] [RFC v3 00/30] Add per-package staging feature
In-Reply-To: <923679587.1206514.1425527688133.JavaMail.zimbra@savoirfairelinux.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
 <923679587.1206514.1425527688133.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <CAHkwnC9Lq6eD1HLP56dBrND4iZ_Dwhh1FrbzPsT+6tO-=AdMrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Mar 5, 2015 at 4:54 AM, J?r?me Oufella
<jerome.oufella@savoirfairelinux.com> wrote:
> Thomas Petazzoni wrote:
>> Could you give some hints about the performance impact of those copies
>> of the staging directory? Does it continue to make the top-level
>> parallel build thing useful?
>
> In this case, it may make sense to use file linking (cp -al)
> instead of file copy, assuming the staging spaces are on the same
> filesystem ?

My only fear if a copy will be overwritten (without using unlink),
also all the copies will be changed, so defeating the purpose of pps,
nevertheless I'm not sure if is a real problem or not.

BR
-- 
Fabio Porcedda
