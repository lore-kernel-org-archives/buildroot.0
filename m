From: Julien Boibessot <julien.boibessot@free.fr>
Date: Mon, 17 Sep 2007 23:17:22 +0200
Subject: [Buildroot] buildroot with ipkg
In-Reply-To: <20070917201401.GA28671@codepoet.org>
References: <7fc538d30709170509s4898cc55keb14ebb718d30090@mail.gmail.com>
	<46EED912.2070902@free.fr> <20070917201401.GA28671@codepoet.org>
Message-ID: <46EEEEE2.7060705@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Erik Andersen a ?crit :
>
> I've thought about this before.  If each package has its
> own target directory, then a packaging tool could simply
> package up the content of that package specific target
> directory as the package content.
>   
I think that's what they are doing in Openwrt: they install packages in 
a custom directory, package them and then install the resulting .ipkg in 
a "staging_dir/root/ like" directory.  Then they generate the JFFS2 from 
that root dir (like Buildroot do).

Do you think it's possible to do that without modifying all the 
Buildroot packages makefiles ?

Julien
