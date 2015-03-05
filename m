From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Wed, 4 Mar 2015 22:54:48 -0500 (EST)
Subject: [Buildroot] [RFC v3 00/30]   Add per-package staging feature
In-Reply-To: <20150303142901.5998a72c@free-electrons.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <20150303142901.5998a72c@free-electrons.com>
Message-ID: <923679587.1206514.1425527688133.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni wrote:
> Could you give some hints about the performance impact of those copies
> of the staging directory? Does it continue to make the top-level
> parallel build thing useful?

In this case, it may make sense to use file linking (cp -al)
instead of file copy, assuming the staging spaces are on the same
filesystem ?

J?r?me
