From: Saa Isamit, Roberto <Roberto.Saa@sonda.com>
Date: Mon, 19 Jul 2010 12:52:37 -0400
Subject: [Buildroot] buildroot not using my proxy settings
In-Reply-To: <AB12B32E73474741A2C5361C433A44DE01F2D86A@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
References: <EE93B8B6CB04054E896A0763A45EF9EB01A51CFD@SONDA-EXCH01.sonda.com>
	<AB12B32E73474741A2C5361C433A44DE01F2D86A@rte-ben-exch.RTE.ADWIN.RENESAS.COM>
Message-ID: <EE93B8B6CB04054E896A0763A45EF9EB01A51D3F@SONDA-EXCH01.sonda.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi:

	That one did work! Apparently I had a typo in the environment
variable. Before I had:

declare -x all_proxy="socks://localhost:5865/"
declare -x ftp_proxy="ftp://localhost:5865/"
declare -x http_proxy="http://localhost:5865/"
declare -x https_proxy="https://localhost:5865/"
declare -x no_proxy="localhost,127.0.0.0/8,*.local,"

and after your advice I have:

declare -x all_proxy="socks://localhost:5865/"
declare -x ftp_proxy="ftp://localhost:5865/"
declare -x http_proxy="http://localhost:5865/"
declare -x https_proxy="https://localhost:5865/"
declare -x no_proxy="localhost,127.0.0.0/8,*.local"

(notice the missing last comma)

	Anyway thanks for your help.

Regards

-----Mensaje original-----
De: Phil Edworthy [mailto:Phil.Edworthy at renesas.com] 
Enviado el: lunes, 19 de julio de 2010 12:40
Para: Saa Isamit, Roberto; buildroot at busybox.net
Asunto: RE: [Buildroot] buildroot not using my proxy settings

Hi,

> Does anyone know if there is another thing to configure to get
> buildroot to use my proxy settings?
> 
> My system is ubuntu linux 10.04 LTS and I'm using buildroot
> v23434. Thanks in advance.

It's not really anything to do with Buildroot, but hey... I had the same
problem in Ubuntu 10.04, try:

export no_proxy=$(echo $no_proxy | sed 's/,$//')

As long as wget works, then Buildroot shouldn't have any problems.

Phil


Sonda S.A.
Visite nuestra pagina: www.sonda.com
La informacion contenida en este correo electronico, asi como en cualquiera de sus archivos adjuntos, es confidencial y esta dirigida exclusivamente a el o los destinatarios indicados. Cualquier uso, reproduccion, divulgacion o distribucion por otras personas distintas de el o los destinatarios esta estrictamente prohibida. Si ha recibido este correo por error, por favor notifiquelo inmediatamente al remitente y borrelo de su sistema sin dejar copia del mismo. SONDA no acepta responsabilidad alguna por cualquier perdida o dano como consecuencia, directa o indirecta, del uso indebido de este e-mail o de los archivos adjuntos al mismo.
