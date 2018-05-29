From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 May 2018 23:42:43 +0200
Subject: [Buildroot] [PATCH 1/1] ti-sgx-*: bump from SDK 02.00 to SDK
 04.00
In-Reply-To: <CABhNV22Fv+QjYta+XhH5mixGPK5R0sOnMv=R3+4qpV+iqGegzg@mail.gmail.com>
References: <1527175458-16091-1-git-send-email-tolvupostur@gmail.com>
 <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
 <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
 <CABhNV22Fv+QjYta+XhH5mixGPK5R0sOnMv=R3+4qpV+iqGegzg@mail.gmail.com>
Message-ID: <20180529234243.699648ec@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 May 2018 14:20:44 +0200, Einar J?n wrote:

> > I'm not sure if we must bump all packages related to the TI SDK or bump all
> > packages one by one to ease the review.  
> 
> I did this in a single commit since any split (except a standalone
> ti-sgx-libgbm) would be a commit with a broken build. The places I?ve
> worked for for the last 5 years hate those.

We definitely want a bisectable patch series, where everything works
between each commit.

> > Also, BR2_PACKAGE_TI_SGX_KM_AM4430 and BR2_PACKAGE_TI_SGX_KM_AM5430
> > symbols are
> > removed. It must be handled in Config.in.legacy.  
> 
> 
> True. I didn?t think of that since none of the defconfigs use it. I can see
> that now there is a legacy patch for the _KM addition.
> Also, the new _KM addition to these keywords makes these parameters a bit
> weird, because it is used in both ti-sgx-km and ti-sgx-um.

I don't see where those renamed symbols are used in ti-sgx-um. The
symbols that have been renamed are:

  BR2_PACKAGE_TI_SGX_AM335X
  BR2_PACKAGE_TI_SGX_AM437X
  BR2_PACKAGE_TI_SGX_AM4430
  BR2_PACKAGE_TI_SGX_AM5430

> > Why S80ti-sgx is removed ?
> >  
> 
> Because it is both unneeded and obsolete.
> The current repo of ti-sgx-um has 3 subfolders, one for each
> BR2_PACKAGE_TI_SGX_KM_AMxxx option. Each one has a sysV init file (called
> rc-???) that is very different from the one I deleted.
> Now I simply rename rc-??? to S80ti-sgx in the post-hook that previously
> copied it from package/ti-sgx-um.

Is the init script provided by upstream reasonably compatible with
Buildroot requirements (it should work with Busybox, etc.) ? We very
often have our own init scripts to make sure they are compatible with
Buildroot-generated systems.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
