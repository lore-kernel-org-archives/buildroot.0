From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Jun 2014 22:18:39 -0300
Subject: [Buildroot] [Patch v3] dcmtk: new package
In-Reply-To: <1403049919-3275-1-git-send-email-tsmrnd0@gmail.com>
References: <1403049919-3275-1-git-send-email-tsmrnd0@gmail.com>
Message-ID: <53A0E8EF.2090309@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/17/2014 09:05 PM, William Frost wrote:

> +config BR2_PACKAGE_DCMTK
> +	bool "dcmtk"
> +	help
> +	  DCMTK is a collection of libraries and applications implementing 
> +	  large parts the DICOM standard. It includes software for examining, 
> +	  constructing and converting DICOM image files, handling offline 
> +	  media, sending and receiving images over a network connection, as 
> +	  well as demonstrative image storage and worklist servers. DCMTK is 
> +	  is written in a mixture of ANSI C and C++. It comes in complete 
> +	  source code and is made available as "open source" software.
> +
> +	  http://dicom.offis.de/dcmtk.php.en

Hi.
It seems the c++ part is mandatory, so it should depend on
BR2_INSTALL_LIBSTDCPP (and add a comment when it's not available, see
package/msgpack/Config.in for an example).
Also there's trailing whitespace in the help text.
Regards.
